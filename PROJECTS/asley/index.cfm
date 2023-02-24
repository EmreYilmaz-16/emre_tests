<cfset strArr=['Component SKUs;Component SKUs - Living Room',
'Component SKUs;Component SKUs - Bedroom',
'Furniture;Furniture - Living Room;Furniture - Living Room - Sectional Sofas',
'Furniture;Furniture - Living Room;Furniture - Living Room - Ottomans',
'Furniture;Furniture - Living Room;Furniture - Living Room - Loveseats',
'Furniture;Furniture - Living Room;Furniture - Living Room - Living Room Chairs',
'Furniture;Furniture - Living Room;Furniture - Living Room - Recliners',
'Furniture;Furniture - Living Room;Furniture - Living Room - Sofas',
'Furniture;Furniture - Bedroom;Furniture - Bedroom - Headboards',
'Furniture;Furniture - Bedroom;Furniture - Bedroom - Mirrored Dressers',
'Furniture;Furniture - Bedroom;Furniture - Bedroom - Beds',
'Furniture;Furniture - Bedroom;Furniture - Bedroom - Dressers',
'Furniture;Furniture - Bedroom;Furniture - Bedroom - Chest of Drawers',
'Furniture;Furniture - Living Room;Furniture - Living Room - Accent Tables',
'Furniture;Furniture - Living Room;Furniture - Living Room - Sofas;Furniture - Living Room - Reclining Sofas',
'Home Decor;Home Decor - Wall Decor;Home Decor - Wall Decor - Wall Clocks',
'Home Decor;Home Decor - Wall Decor;Home Decor - Wall Decor - Wall Mirrors',
'Home Decor;Home Decor - Wall Decor;Home Decor - Wall Decor - Wall Art',
'Home Decor;Home Decor - Wall Decor',
'Home Decor - Wall Decor',
'Furniture;Furniture - Bedroom;Furniture - Bedroom - Bedroom Storage;Furniture - Bedroom - Bedroom Benches',
'Furniture;Furniture - Bedroom;Furniture - Bedroom - Bedroom Storage',
'Component SKUs',
'Furniture;Furniture - Living Room;Furniture - Living Room - Sofas;Furniture - Living Room - Sleeper Sofas',
'Furniture;Furniture - Bedroom;Furniture - Bedroom - Beds;Furniture - Bedroom - Bedroom Storage',
'Furniture - Living Room - Loveseats;Furniture - Living Room - Living Room Chairs',
'Furniture;Furniture - Living Room;Furniture - Living Room - Sectional Sleeper Sofas',
'Furniture;Furniture - Bedroom;Furniture - Bedroom - Dressers;Kids;Kids - Furniture;Kids - Furniture - Dressers',
'Furniture;Furniture - Bedroom;Furniture - Bedroom - Headboards;Kids;Kids - Furniture;Kids - Furniture - Headboards',
'Component SKUs - Bedroom',
'Furniture;Furniture - Bedroom;Furniture - Bedroom - Mirrored Dressers;Kids;Kids - Furniture;Kids - Furniture - Dressers',
'Mattresses;Mattresses - Mattress by Size;Mattresses - Mattress by Size - Queen',
'Mattresses;Mattresses - Mattress by Size;Mattresses - Mattress by Size - Twin',
'Mattresses;Mattresses - Mattress by Size;Mattresses - Mattress by Size - Full',
'Home Decor;Home Decor - Blankets and Throws',
'Home Decor;Home Decor - Poufs',
'Home Decor;Home Decor - Throw Pillows;Home Decor - Throw Pillows - Accent Pillows',
'Outdoor;Outdoor - Patio Accessories;Outdoor - Patio Accessories - Outdoor Pillows;Home Decor;Home Decor - Throw Pillows;Home Decor - Throw Pillows - Indoor Outdoor Pillows;Home Decor - Throw Pillows - Accent Pillows',
'Furniture;Furniture - Living Room;Furniture - Living Room - Recliners;Furniture - Living Room - Power Seating',
'Furniture;Furniture - Living Room;Furniture - Living Room - TV Stands and Media Centers',
'Component SKUs;Component SKUs - Kitchen and Dining Room',
'Furniture;Furniture - Kitchen and Dining Room;Furniture - Kitchen and Dining Room - Dining Room Chairs',
'Furniture;Furniture - Kitchen and Dining Room;Furniture - Kitchen and Dining Room - Dining Storage',
'Furniture;Furniture - Entryway;Furniture - Entryway - Benches',
'Furniture;Furniture - Kitchen and Dining Room;Furniture - Kitchen and Dining Room - Dining Room Tables',
'Furniture;Furniture - Kitchen and Dining Room;Furniture - Kitchen and Dining Room - Bar Stools;Furniture - Kitchen and Dining Room - Bar Furniture',
'Furniture;Furniture - Kitchen and Dining Room;Furniture - Kitchen and Dining Room - Dining Room Counter Tables;Furniture - Kitchen and Dining Room - Dining Room Sets',
'Furniture;Furniture - Kitchen and Dining Room;Furniture - Kitchen and Dining Room - Dining Room Tables;Furniture - Kitchen and Dining Room - Dining Room Sets',
'Furniture;Furniture - Kitchen and Dining Room;Furniture - Kitchen and Dining Room - Dining Room Sets',
'Furniture;Furniture - Kitchen and Dining Room;Furniture - Kitchen and Dining Room - Dining Room Tables;Furniture - Kitchen and Dining Room - Dining Room Counter Tables',
'Furniture;Furniture - Kitchen and Dining Room;Furniture - Kitchen and Dining Room - Dining Room Tables;Furniture - Kitchen and Dining Room - Dining Room Counter Tables;Furniture - Kitchen and Dining Room - Dining Room Sets',
'Furniture;Furniture - Bedroom;Furniture - Bedroom - Chest of Drawers;Kids;Kids - Furniture;Kids - Furniture - Chest of Drawers;Kids - Furniture - Girls Bedroom Furniture',
'Furniture;Furniture - Bedroom;Furniture - Bedroom - Dressers;Kids;Kids - Furniture;Kids - Furniture - Dressers;Kids - Furniture - Girls Bedroom Furniture',
'Furniture;Furniture - Bedroom;Furniture - Bedroom - Nightstands;Kids;Kids - Furniture;Kids - Furniture - Nightstands;Kids - Furniture - Girls Bedroom Furniture',
'Furniture;Furniture - Bedroom;Furniture - Bedroom - Mirrored Dressers;Kids;Kids - Furniture;Kids - Furniture - Dressers;Kids - Furniture - Girls Bedroom Furniture',
'Furniture;Furniture - Bedroom;Furniture - Bedroom - Nightstands',
'Furniture;Furniture - Living Room;Furniture - Living Room - Storage',
'Mattresses;Mattresses - Mattress by Size;Mattresses - Mattress by Size - King',
'Furniture;Furniture - Living Room;Furniture - Living Room - Loveseats;Furniture - Living Room - Reclining Loveseats',
'Furniture;Furniture - Kitchen and Dining Room;Furniture - Kitchen and Dining Room - Bar Stools;Furniture - Kitchen and Dining Room - Bar Furniture;Furniture - Kitchen and Dining Room - Dining Room Counter Tables',
'Furniture;Furniture - Bedroom;Furniture - Bedroom - TV Stands and Media Centers',
'Furniture;Furniture - Bedroom;Furniture - Bedroom - Nightstands;Kids;Kids - Furniture;Kids - Furniture - Nightstands',
'Furniture;Furniture - Living Room;Furniture - Living Room - Sectional Sofas;Furniture - Living Room - Reclining Sectional Sofas',
'Furniture;Furniture - Bedroom;Furniture - Bedroom - Bedroom Benches',
'Furniture;Furniture - Living Room;Furniture - Living Room - End and Side Tables',
'Furniture;Furniture - Living Room;Furniture - Living Room - Console Tables;Furniture - Entryway;Furniture - Entryway - Tables',
'Furniture;Furniture - Living Room;Furniture - Living Room - Coffee Tables',
'Furniture;Furniture - Living Room;Furniture - Living Room - Coffee Tables;Furniture - Living Room - End and Side Tables',
'Furniture;Furniture - Living Room;Furniture - Living Room - Accent Storage Cabinets',
'Furniture;Furniture - Living Room;Furniture - Living Room - Living Room Chairs;Furniture - Bedroom;Furniture - Bedroom - Bedroom Chairs',
'Furniture - Living Room - Accent Tables;Furniture - Living Room - Accent Storage Cabinets;Furniture - Living Room - Storage;Furniture - Bedroom - Bedroom Storage;Furniture - Entryway - Tables;Furniture - Entryway - Storage;Furniture - Home Office - Office Storage;Home Decor - Home Accents - Storage and Organization',
'Furniture;Furniture - Bedroom;Furniture - Bedroom - Bedroom Benches;Furniture - Entryway;Furniture - Entryway - Benches',
'Furniture;Furniture - Living Room;Furniture - Living Room - Storage;Furniture - Bedroom;Furniture - Bedroom - Bedroom Benches;Furniture - Entryway;Furniture - Entryway - Benches;Furniture - Entryway - Storage;Home Decor;Home Decor - Home Accents;Home Decor - Home Accents - Storage and Organization',
'Furniture - Living Room - Accent Tables;Furniture - Entryway - Tables',
'Mattresses;Mattresses - Bedding Accessories;Mattresses - Bedding Accessories - Bed Pillows;Bedding;Bedding - Bed Pillows',
'Mattresses;Mattresses - Mattress by Size;Mattresses - Mattress by Size - California King;Mattresses - Mattress by Type;Mattresses - Mattress by Type - Memory Foam',
'Mattresses;Mattresses - Mattress by Size;Mattresses - Mattress by Size - King;Mattresses - Mattress by Type;Mattresses - Mattress by Type - Memory Foam',
'Mattresses;Mattresses - Mattress by Size;Mattresses - Mattress by Size - Queen;Mattresses - Mattress by Type;Mattresses - Mattress by Type - Memory Foam',
'Mattresses;Mattresses - Mattress by Size;Mattresses - Mattress by Size - Twin;Mattresses - Mattress by Type;Mattresses - Mattress by Type - Memory Foam',
'Mattresses;Mattresses - Mattress by Size;Mattresses - Mattress by Size - Full;Mattresses - Mattress by Type;Mattresses - Mattress by Type - Memory Foam',
'Furniture;Furniture - Home Office;Furniture - Home Office - Bookcases',
'Component SKUs;Component SKUs - Home Office',
'Furniture;Furniture - Kitchen and Dining Room;Furniture - Kitchen and Dining Room - Dining Room Tables;Furniture - Kitchen and Dining Room - Dining Storage;Furniture - Kitchen and Dining Room - Dining Room Counter Tables',
'Furniture - Kitchen and Dining Room - Bar Stools;Furniture - Kitchen and Dining Room - Bar Furniture',
'Furniture;Furniture - Kitchen and Dining Room;Furniture - Kitchen and Dining Room - Dining Benches;Furniture - Entryway;Furniture - Entryway - Benches',
'Furniture - Kitchen and Dining Room - Dining Benches',
'Furniture - Living Room - Storage;Furniture - Kitchen and Dining Room - Dining Storage;Furniture - Entryway - Storage;Furniture - Home Office - Office Storage;Home Decor - Home Accents - Storage and Organization',
'Furniture;Furniture - Entryway;Furniture - Entryway - Storage',
'Furniture - Living Room - Storage;Furniture - Kitchen and Dining Room - Dining Storage;Furniture - Home Office - Office Storage;Home Decor - Home Accents - Storage and Organization',
'Kids;Kids - Furniture;Kids - Furniture - Headboards',
'Home Decor;Home Decor - Home Accents;Home Decor - Home Accents - Baskets and Boxes',
'Home Decor;Home Decor - Home Accents;Home Decor - Home Accents - Vases and Bottles',
'Home Decor - Home Accents - Candles and Candle Holders',
'Home Decor;Home Decor - Home Accents;Home Decor - Home Accents - Bowls and Trays',
'Home Decor;Home Decor - Home Accents;Home Decor - Home Accents - Canisters and Jars',
'Home Decor;Home Decor - Home Accents;Home Decor - Home Accents - Candles and Candle Holders',
'Home Decor - Home Accents - Candles and Candle Holders;Home Decor - Home Accents - Canisters and Jars;Home Decor - Home Accents - Picture Frames;Home Decor - Home Accents - Vases and Bottles',
'Furniture - Living Room - Living Room Chairs;Furniture - Bedroom - Bedroom Chairs;Home Decor - Home Accents;Home Decor - Home Accents - Stools',
'Home Decor - Home Accents - Stools;Home Decor - Poufs',
'Furniture;Furniture - Home Office;Furniture - Home Office - Office Chairs',
'Furniture;Furniture - Home Office;Furniture - Home Office - Desks',
'Furniture;Furniture - Home Office;Furniture - Home Office - Office Storage',
'Furniture;Furniture - Bedroom;Furniture - Bedroom - Bedroom Chairs',
'Furniture;Furniture - Bedroom;Home Decor;Home Decor - Wall Decor;Home Decor - Wall Decor - Wall Mirrors',
'Furniture;Furniture - Bedroom;Furniture - Bedroom - Chest of Drawers;Kids;Kids - Furniture;Kids - Furniture - Chest of Drawers',
'Furniture;Furniture - Bedroom;Furniture - Bedroom - Vanities;Kids;Kids - Furniture;Kids - Furniture - Vanities',
'Kids;Kids - Furniture;Kids - Furniture - Beds;Kids - Furniture - Girls Bedroom Furniture',
'Furniture;Furniture - Bedroom;Furniture - Bedroom - Chest of Drawers;Kids;Kids - Furniture;Kids - Furniture - Chest of Drawers;Kids - Furniture - Boys Bedroom Furniture',
'Kids;Kids - Furniture;Kids - Furniture - Headboards;Kids - Furniture - Boys Bedroom Furniture',
'Furniture;Furniture - Bedroom;Furniture - Bedroom - Mirrored Dressers;Kids;Kids - Furniture;Kids - Furniture - Mirrored Dressers;Kids - Furniture - Girls Bedroom Furniture',
'Kids;Kids - Furniture;Kids - Furniture - Headboards;Kids - Furniture - Girls Bedroom Furniture',
'Mattresses;Mattresses - Bedding Accessories;Mattresses - Bedding Accessories - Quilts and Coverlets;Bedding;Bedding - Quilts and Coverlets',
'Mattresses;Mattresses - Mattress by Type;Mattresses - Mattress by Type - Foundations & Bed Frames',
'Mattresses;Mattresses - Mattress by Size;Mattresses - Mattress by Size - California King',
'Furniture;Furniture - Home Office;Furniture - Home Office - Desks;Furniture - Home Office - Bookcases',
'Outdoor;Outdoor - Patio Accessories;Outdoor - Patio Accessories - Outdoor Pillows;Home Decor;Home Decor - Throw Pillows;Home Decor - Throw Pillows - Indoor Outdoor Pillows',
'Home Decor;Home Decor - Wall Decor;Home Decor - Wall Decor - Wall Sculptures ',
'Furniture;Furniture - Bedroom;Furniture - Bedroom - Mirrored Dressers;Kids;Kids - Furniture;Kids - Furniture - Mirrored Dressers;Kids - Furniture - Boys Bedroom Furniture',
'Kids;Kids - Furniture;Kids - Furniture - Beds;Kids - Furniture - Boys Bedroom Furniture',
'Kids;Kids - Furniture;Kids - Furniture - Beds',
'Kids;Kids - Furniture;Kids - Furniture - Beds;Kids - Furniture - Bunk Beds;Kids - Furniture - Boys Bedroom Furniture',
'Outdoor;Outdoor - Patio Furniture;Outdoor - Patio Furniture - Seating',
'Outdoor - Patio Furniture - Seating;Outdoor - Outdoor Dining - Dining Chairs',
'Furniture;Furniture - Kitchen and Dining Room;Furniture - Kitchen and Dining Room - Bar Furniture;Outdoor;Outdoor - Outdoor Dining;Outdoor - Outdoor Dining - Bar Furniture',
'Home Decor - Home Accents - Candles and Candle Holders;Home Decor - Wall Decor - Wall Mirrors',
'Furniture;Furniture - Entryway;Furniture - Entryway - Tables',
'Furniture;Furniture - Kitchen and Dining Room;Furniture - Kitchen and Dining Room - Bar Furniture;Home Decor;Home Decor - Dining and Entertainment',
'Home Decor;Home Decor - Home Accents;Home Decor - Home Accents - Storage and Organization',
'Furniture;Furniture - Kitchen and Dining Room;Furniture - Kitchen and Dining Room - Bar Furniture',
'Furniture;Furniture - Living Room;Furniture - Living Room - Sectional Sofas;Furniture - Living Room - Sleeper Sofas',
'Furniture;Furniture - Bedroom;Furniture - Bedroom - Mirrored Dressers;Kids;Kids - Furniture;Kids - Furniture - Dressers;Kids - Furniture - Boys Bedroom Furniture;Kids - Furniture - Girls Bedroom Furniture',
'Kids;Kids - Furniture;Kids - Furniture - Beds;Kids - Furniture - Boys Bedroom Furniture;Kids - Furniture - Girls Bedroom Furniture',
'Furniture;Furniture - Bedroom;Furniture - Bedroom - Dressers;Kids - Furniture - Girls Bedroom Furniture',
'Furniture;Furniture - Bedroom;Furniture - Bedroom - Bedroom Benches;Furniture - Entryway;Furniture - Entryway - Benches;Home Decor;Home Decor - Home Accents;Home Decor - Home Accents - Storage and Organization',
'Furniture - Kitchen and Dining Room - Bar Furniture;Home Decor - Home Accents - Bowls and Trays;Home Decor - Home Accents - Storage and Organization',
'Furniture;Furniture - Living Room;Furniture - Living Room - Storage;Furniture - Entryway;Furniture - Entryway - Storage;Home Decor;Home Decor - Home Accents;Home Decor - Home Accents - Storage and Organization',
'Kids;Kids - Furniture;Kids - Furniture - Storage',
'Mattresses;Mattresses - Bedding Accessories;Mattresses - Bedding Accessories - Comforter Sets;Bedding;Bedding - Comforter Sets',
'Kids;Kids - Bedding;Kids - Bedding - Comforters;Mattresses;Mattresses - Bedding Accessories;Mattresses - Bedding Accessories - Comforter Sets;Bedding;Bedding - Comforter Sets',
'Rugs;Rugs - Area Rugs',
'Kids;Kids - Furniture;Kids - Furniture - Beds;Kids - Furniture - Bunk Beds;Kids - Furniture - Girls Bedroom Furniture',
'Mattresses;Mattresses - Mattress by Size;Mattresses - Mattress by Size - Full;Mattresses - Mattress by Type;Mattresses - Mattress by Type - Innerspring',
'Mattresses;Mattresses - Mattress by Size;Mattresses - Mattress by Size - Queen;Mattresses - Mattress by Type;Mattresses - Mattress by Type - Innerspring',
'Mattresses;Mattresses - Mattress by Size;Mattresses - Mattress by Size - King;Mattresses - Mattress by Type;Mattresses - Mattress by Type - Innerspring',
'Mattresses;Mattresses - Mattress by Size;Mattresses - Mattress by Size - Twin;Mattresses - Mattress by Type;Mattresses - Mattress by Type - Hybrid',
'Mattresses;Mattresses - Mattress by Size;Mattresses - Mattress by Size - Full;Mattresses - Mattress by Type;Mattresses - Mattress by Type - Hybrid',
'Mattresses;Mattresses - Mattress by Size;Mattresses - Mattress by Size - Queen;Mattresses - Mattress by Type;Mattresses - Mattress by Type - Hybrid',
'Mattresses;Mattresses - Mattress by Size;Mattresses - Mattress by Size - King;Mattresses - Mattress by Type;Mattresses - Mattress by Type - Hybrid',
'Mattresses;Mattresses - Mattress by Size;Mattresses - Mattress by Size - California King;Mattresses - Mattress by Type;Mattresses - Mattress by Type - Hybrid',
'Mattresses;Mattresses - Mattress by Size;Mattresses - Mattress by Size - Twin;Mattresses - Mattress by Type;Mattresses - Mattress by Type - Innerspring',
'Furniture;Furniture - Bedroom;Furniture - Bedroom - Dressers;Kids;Kids - Furniture;Kids - Furniture - Dressers;Kids - Furniture - Boys Bedroom Furniture;Kids - Furniture - Girls Bedroom Furniture',
'Furniture;Furniture - Bedroom;Furniture - Bedroom - Chest of Drawers;Kids;Kids - Furniture;Kids - Furniture - Chest of Drawers;Kids - Furniture - Boys Bedroom Furniture;Kids - Furniture - Girls Bedroom Furniture',
'Kids;Kids - Furniture;Kids - Furniture - Headboards;Kids - Furniture - Boys Bedroom Furniture;Kids - Furniture - Girls Bedroom Furniture',
'Furniture;Furniture - Bedroom;Furniture - Bedroom - Nightstands;Kids;Kids - Furniture;Kids - Furniture - Nightstands;Kids - Furniture - Boys Bedroom Furniture;Kids - Furniture - Girls Bedroom Furniture',
'Mattresses;Mattresses - Mattress by Type;Mattresses - Mattress by Type - Power Bases',
'Furniture;Furniture - Living Room;Furniture - Living Room - Loveseats;Furniture - Living Room - Living Room Chairs',
'Kids;Kids - Furniture;Kids - Furniture - Beds;Kids - Furniture - Storage;Kids - Furniture - Girls Bedroom Furniture',
'Furniture;Furniture - Living Room;Furniture - Living Room - Living Room Chairs;Furniture - Bedroom - Bedroom Chairs;Furniture - Home Office - Office Chairs',
'Outdoor - Patio Furniture - Seating',
'Outdoor;Outdoor - Patio Furniture;Outdoor - Patio Furniture - Tables',
'Furniture - Living Room - Accent Tables;Furniture - Living Room - Accent Storage Cabinets;Furniture - Living Room - Storage;Furniture - Kitchen and Dining Room - Dining Storage;Furniture - Entryway - Tables;Furniture - Entryway - Storage;Furniture - Home Office - Office Storage',
'Furniture;Furniture - Kitchen and Dining Room;Furniture - Kitchen and Dining Room - Dining Room Tables;Furniture - Kitchen and Dining Room - Dining Storage',
'Kids;Kids - Furniture;Kids - Furniture - Vanities;Kids - Furniture - Girls Bedroom Furniture',
'Kids;Kids - Furniture;Kids - Furniture - Beds;Kids - Furniture - Storage',
'Furniture - Bedroom - Beds',
'Kids;Kids - Furniture;Kids - Furniture - Dressers',
'Mattresses;Mattresses - Mattress by Size;Mattresses - Mattress by Size - King;Mattresses - Mattress by Type;Mattresses - Mattress by Type - Power Bases',
'Outdoor;Outdoor - Outdoor Dining;Outdoor - Outdoor Dining - Dining Chairs',
'Furniture;Furniture - Living Room;Furniture - Living Room - Accent Tables;Furniture - Kitchen and Dining Room - Dining Room Counter Tables',
'Furniture;Furniture - Kitchen and Dining Room;Furniture - Kitchen and Dining Room - Dining Room Counter Tables',
'Furniture;Furniture - Bedroom;Furniture - Bedroom - Mirrored Dressers;Kids;Kids - Furniture;Kids - Furniture - Mirrored Dressers',
'Outdoor;Outdoor - Patio Furniture;Outdoor - Patio Furniture - Seating;Outdoor - Patio Accessories',
'Furniture;Furniture - Kitchen and Dining Room;Furniture - Kitchen and Dining Room - Dining Storage;Furniture - Entryway;Furniture - Entryway - Tables;Furniture - Entryway - Storage',
'Furniture;Furniture - Kitchen and Dining Room;Furniture - Kitchen and Dining Room - Dining Room Tables;Furniture - Kitchen and Dining Room - Bar Stools;Furniture - Kitchen and Dining Room - Dining Storage;Furniture - Kitchen and Dining Room - Dining Room Counter Tables;Furniture - Kitchen and Dining Room - Dining Room Sets',
'Furniture - Living Room - Accent Tables;Furniture - Living Room - End and Side Tables',
'Furniture - Living Room - Accent Storage Cabinets;Furniture - Living Room - Storage;Furniture - Entryway - Storage;Furniture - Home Office - Office Storage;Home Decor - Home Accents - Storage and Organization',
'Furniture - Living Room - Accent Storage Cabinets;Furniture - Living Room - Storage;Furniture - Entryway - Storage;Home Decor - Home Accents - Storage and Organization',
'Furniture;Furniture - Entryway;Furniture - Entryway - Benches;Furniture - Entryway - Storage;Home Decor;Home Decor - Home Accents;Home Decor - Home Accents - Storage and Organization',
'Furniture;Furniture - Living Room;Furniture - Living Room - Console Tables;Furniture - Living Room - TV Stands and Media Centers',
'Furniture;Furniture - Bedroom;Furniture - Bedroom - Chest of Drawers;Kids - Furniture - Girls Bedroom Furniture',
'Furniture;Furniture - Living Room;Furniture - Living Room - Storage;Furniture - Bedroom;Furniture - Bedroom - Bedroom Storage;Furniture - Entryway;Furniture - Entryway - Benches;Furniture - Entryway - Storage;Furniture - Home Office;Furniture - Home Office - Office Storage;Home Decor;Home Decor - Home Accents;Home Decor - Home Accents - Storage and Organization',
'Furniture - Home Office - Office Chairs',
'Home Decor - Wall Decor - Wall Mirrors',
'Furniture;Furniture - Living Room;Furniture - Living Room - Reclining Loveseats',
'Furniture;Furniture - Living Room;Furniture - Living Room - Reclining Sofas',
'Kids;Kids - Furniture;Kids - Furniture - Beds;Kids - Furniture - Bunk Beds',
'Furniture;Furniture - Living Room;Furniture - Living Room - Accent Storage Cabinets;Furniture - Entryway;Furniture - Entryway - Tables;Home Decor;Home Decor - Home Accents',
'Furniture;Furniture - Living Room;Furniture - Living Room - Accent Tables;Furniture - Living Room - Accent Storage Cabinets;Furniture - Living Room - Storage;Furniture - Bedroom;Furniture - Bedroom - Bedroom Storage;Furniture - Entryway;Furniture - Entryway - Tables;Furniture - Entryway - Storage;Home Decor;Home Decor - Home Accents;Home Decor - Home Accents - Storage and Organization',
'Furniture;Furniture - Living Room;Furniture - Living Room - Accent Tables;Furniture - Living Room - End and Side Tables;Furniture - Entryway;Furniture - Entryway - Tables;Home Decor;Home Decor - Home Accents;Home Decor - Home Accents - Storage and Organization',
'Furniture;Furniture - Living Room;Furniture - Living Room - Ottomans;Furniture - Living Room - Storage',
'Furniture;Furniture - Living Room;Furniture - Living Room - Sleeper Sofas',
'Home Decor;Home Decor - Home Accents;Home Decor - Home Accents - Accent Furniture',
'Furniture;Furniture - Kitchen and Dining Room;Furniture - Kitchen and Dining Room - Bar Stools;Furniture - Kitchen and Dining Room - Bar Furniture;Furniture - Kitchen and Dining Room - Dining Room Counter Chairs',
'Furniture;Furniture - Kitchen and Dining Room;Furniture - Kitchen and Dining Room - Bar Stools',
'Uncategorized',
'Kids;Kids - Furniture;Kids - Furniture - Beds;Kids - Furniture - Bunk Beds;Kids - Furniture - Storage',
'Furniture;Furniture - Living Room;Furniture - Living Room - Reclining Sectional Sofas',
'Furniture;Furniture - Living Room;Furniture - Living Room - Accent Tables;Furniture - Living Room - Accent Storage Cabinets;Furniture - Living Room - Storage;Furniture - Entryway;Furniture - Entryway - Tables',
'Furniture;Furniture - Living Room;Furniture - Living Room - Console Tables',
'Kids;Kids - Furniture;Kids - Furniture - Desks',
'Furniture;Furniture - Kitchen and Dining Room;Furniture - Kitchen and Dining Room - Dining Benches',
'Furniture;Furniture - Kitchen and Dining Room;Furniture - Kitchen and Dining Room - Dining Room Tables;Furniture - Kitchen and Dining Room - Dining Benches;Furniture - Kitchen and Dining Room - Dining Room Sets',
'Furniture;Furniture - Living Room;Furniture - Living Room - Accent Tables;Furniture - Entryway;Furniture - Entryway - Tables',
'Kids;Kids - Furniture;Kids - Furniture - Bunk Beds',
'Mattresses;Mattresses - Mattress by Size;Mattresses - Mattress by Size - Twin XL',
'Furniture;Furniture - Living Room;Furniture - Bedroom;Furniture - Bedroom - Bedroom Benches;Furniture - Entryway;Furniture - Entryway - Benches',
'Furniture;Furniture - Living Room;Furniture - Living Room - Storage;Furniture - Bedroom;Furniture - Bedroom - Bedroom Storage;Furniture - Bedroom - Bedroom Benches;Furniture - Entryway;Furniture - Entryway - Benches;Furniture - Entryway - Storage;Home Decor;Home Decor - Home Accents;Home Decor - Home Accents - Storage and Organization',
'Furniture;Furniture - Kitchen and Dining Room;Furniture - Living Room - Storage',
'Furniture;Furniture - Home Office;Furniture - Home Office - Gaming;Furniture - Home Office - Office Chairs',
'Furniture - Home Office;Furniture - Home Office - Desks;Furniture - Home Office - Gaming;Kids;Kids - Furniture;Kids - Furniture - Desks',
'Furniture;Furniture - Home Office;Furniture - Home Office - Desks;Furniture - Home Office - Gaming;Kids;Kids - Furniture;Kids - Furniture - Desks',
'Furniture;Furniture - Living Room;Furniture - Living Room - Accent Tables;Furniture - Living Room - Accent Storage Cabinets;Furniture - Bedroom - Bedroom Storage;Furniture - Entryway - Tables;Home Decor;Home Decor - Home Accents;Home Decor - Home Accents - Storage and Organization',
'Furniture;Furniture - Living Room;Furniture - Living Room - End and Side Tables;Furniture - Living Room - Console Tables;Furniture - Living Room - Storage;Furniture - Bedroom;Furniture - Bedroom - Bedroom Storage;Furniture - Entryway;Furniture - Entryway - Tables',
'Furniture;Furniture - Living Room;Furniture - Living Room - Accent Tables;Furniture - Living Room - Accent Storage Cabinets;Furniture - Kitchen and Dining Room;Furniture - Kitchen and Dining Room - Dining Storage;Furniture - Kitchen and Dining Room - Bar Furniture;Furniture - Entryway;Furniture - Entryway - Tables;Furniture - Entryway - Storage;Home Decor - Home Accents;Home Decor - Home Accents - Storage and Organization',
'Furniture;Furniture - Living Room;Furniture - Living Room - Accent Tables;Home Decor - Home Accents',
'Furniture;Furniture - Living Room;Furniture - Living Room - TV Stands and Media Centers;Furniture - Living Room - Storage',
'Furniture;Furniture - Home Office;Furniture - Home Office - Office Chairs;Furniture - Home Office - Gaming',
'Outdoor;Outdoor - Patio Furniture;Outdoor - Patio Furniture - Seating;Outdoor - Patio Furniture - Tables',
'Outdoor;Outdoor - Outdoor Dining;Outdoor - Outdoor Dining - Dining Tables;Outdoor - Outdoor Dining - Dining Chairs',
'Furniture - Living Room - TV Stands and Media Centers;Furniture - Living Room - Storage',
'Furniture;Furniture - Living Room;Furniture - Living Room - Reclining Sofas;Furniture - Living Room - Power Seating',
'Lighting;Lighting - Lamps;Lighting - Lamps - Table Lamps',
'Furniture;Furniture - Living Room;Furniture - Living Room - Reclining Loveseats;Furniture - Living Room - Power Seating',
'Furniture;Furniture - Home Office;Furniture - Home Office - Desks;Furniture - Home Office - Gaming',
'Furniture;Furniture - Living Room;Furniture - Living Room - Coffee Tables;Furniture - Living Room - Storage',
'Home Decor;Home Decor - Home Accents;Home Decor - Home Accents - Sculptures',
'Furniture - Living Room - Console Tables;Furniture - Living Room - TV Stands and Media Centers;Furniture - Living Room - Storage',
'Kids;Kids - Furniture;Kids - Furniture - Chest of Drawers',
'Outdoor;Outdoor - Outdoor Dining;Outdoor - Outdoor Dining - Dining Tables',
'Furniture;Furniture - Living Room - Accent Storage Cabinets',
'Furniture;Furniture - Bedroom',
'Bedding;Bedding - Comforter Sets',
'Bedding;Bedding - Quilts and Coverlets',
'Furniture;Furniture - Kitchen and Dining Room;Furniture - Kitchen and Dining Room - Dining Room Tables;Furniture - Kitchen and Dining Room - Dining Room Chairs',
'Outdoor;Outdoor - Outdoor Dining;Outdoor - Outdoor Dining - Bar Furniture',
'Outdoor;Outdoor - Outdoor Dining;Outdoor - Outdoor Dining - Bar Stools',
'Furniture - Living Room;Furniture - Living Room - Sectional Sofas',
'Lighting;Lighting - Lamps;Lighting - Lamps - Floor Lamps',
'Kids - Bedding;Kids - Bedding - Comforters',
'Kids - Bedding;Kids - Bedding - Quilts',
'Furniture;Furniture - Living Room;Furniture - Living Room - Reclining Sectional Sofas;Furniture - Living Room - Power Seating',
'Lighting;Lighting - Ceiling;Lighting - Ceiling - Pendants',
'Component SKUs;Component SKUs - Outdoor',
'Lighting;Lighting - Lamps;Lighting - Lamps - Desk Lamps',
'Furniture - Living Room - Accent Storage Cabinets;Home Decor;Home Decor - Home Accents',
'Home Decor;Home Decor - Home Accents;Home Decor - Home Accents - Stools',
'Outdoor;Outdoor - Patio Accessories;Outdoor - Patio Accessories - Firepits',
'Mattresses;Mattresses - Mattress by Type;Mattresses - Mattress by Type - Memory Foam',
'Furniture;Furniture - Bedroom;Furniture - Bedroom - Vanities',
'Mattresses;Mattresses - Mattress by Type;Mattresses - Mattress by Type - Hybrid',
'Furniture;Furniture - Kitchen and Dining Room;Furniture - Kitchen and Dining Room - Bar Furniture;Furniture - Kitchen and Dining Room - Dining Room Counter Tables',
'Outdoor;Outdoor - Patio Accessories;Outdoor - Patio Accessories - Outdoor Pillows',
'Mattresses;Mattresses - Mattress by Type;Mattresses - Mattress by Type - Innerspring',
'Furniture;Furniture - Living Room;Furniture - Living Room - Sectional Sofas;Furniture - Living Room - Power Seating',
'Furniture;Furniture - Living Room;Furniture - Living Room - Power Seating;Furniture - Living Room - Recliners',
'Kids;Kids - Furniture;Kids - Furniture - Nightstands',
'Kids;Kids - Furniture;Kids - Furniture - Mirrored Dressers']>
<cfloop array="#strArr#" item="it">
  <cfset liste=listLast(it,";")>
  <cfset elemansayisi=listLen(liste,"-")>
  <cfloop from="1" to="#elemansayisi#" index="i">
    <cfquery name="q1" datasource="#dsn#">
       SELECT * FROM PRODUCT_CAT where PRODUCT_CAT='#trim(listGetAt(liste,i,"-"))#'
    </cfquery>
    <cfif q1.recordCount>
    
    <cfelse>
    </cfif>
  </cfloop>
</cfloop>






<!----------

<cfloop array="#strArr#" item="it">
    <cfset liste=listlast(it,";")>
    <cfset lelis=listLen(liste,"-")>
    <cfloop list="#liste#" item="ix" delimiters="-" index="i">
      <cfquery name="ihv" datasource="#dsn#">
        SELECT * FROM PRODUCT_CAT where PRODUCT_CAT='#trim(ix)#'
      </cfquery>
      <cfdump var="#ihv#">
      <cfif ihv.recordCount>

      <cfelse>
        <cfif i eq 1>
          <cfquery name="ins" datasource="#dsn#">
            INSERT INTO PRODUCT_CAT (UPPER_CATID,PRODUCT_CAT) VALUES (0,'#ix#')
          </cfquery>
          <cfelse>
          <cfif i gt 2>
          
          <cfelse>
          
          <cfset UpperCat=listGetAt(liste,i-1,"-")>
          <cfquery name="ihv2" datasource="#dsn#">
            SELECT * FROM PRODUCT_CAT where PRODUCT_CAT='#trim(UpperCat)#'
          </cfquery>
           <cfquery name="ins" datasource="#dsn#">
            INSERT INTO PRODUCT_CAT (UPPER_CATID,PRODUCT_CAT) VALUES (#ihv2.PRODUCT_CATID#,'#ix#')
          </cfquery>
          </cfif>
        </cfif>
      </cfif>
    </cfloop>
   <!----<cfquery name="ihv" datasource="#dsn#">
    SELECT * FROM PRODUCT_CAT AS PC0
    <cfloop list="#liste#" item="ix" delimiters="-" index="i">
      LEFT JOIN PRODUCT_CAT AS PC#i# ON PC#i#.UPPER_CATID=PC#i-1#.PRODUCT_CATID
    </cfloop>       
    WHERE 1=1 <cfloop list="#liste#" item="ix" delimiters="-" index="i">
      AND PC#i-1#.PRODUCT_CAT='#trim(ix)#'
    </cfloop> 
  </cfquery>---->
  
    
</cfloop>
---------->